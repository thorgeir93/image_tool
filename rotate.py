import os
from PIL import Image
from PIL import ExifTags

def rotate(picture, degree, image_path):
    """
    """
    print('rotate {0}'.format(degree))
    #return
    picture = picture.rotate(degree, expand=True)
    picture.save(image_path)

def main(filepath):
    image = Image.open(filepath)

    try:
        for orientation in ExifTags.TAGS.keys():
            print( orientation )
            if ExifTags.TAGS[orientation]=='Orientation':
                break

        exif = dict(image._getexif().items())

        print(exif[orientation])
        if exif[orientation] == 3:
            rotate(image, 180, filepath)
        elif exif[orientation] == 6:
            rotate(image, 270, filepath)
        elif exif[orientation] == 8:
            rotate(image, 90, filepath)
    
    except (AttributeError, KeyError, IndexError):
        raise
        # cases: image don't have getexif
        pass
        print('ha')

    finally:
        image.close()

# This method does not keep the exif data on the image.
#main('/home/thorgeir/on_side_was.jpg')

import subprocess

ROTATION = {
    1: 0,
    8: 90,
    3: 180,
    6: 270,
}
def shell_cmd(args, wait=True):
    try:
        if (wait):
            p = subprocess.Popen(args, stdout=subprocess.PIPE)
            p.wait()
        else:
            p = subprocess.Popen(
                args, 
                stdin=None,
                stdout=None,
                stderr=None,
                close_fds=True
            )

        result, error = p.communicate()

    except subprocess.CalledProcessError as e:
        sys.stderr.write(
            "common::shell_cmd() : "
            "[ERROR]: output = {0}, "
            "error code = {1}\n".format(
                e.output, e.returncode
            )
        )

    result = result.decode('utf-8')
    result = result.split('\n')
    result = filter(None, result)
    result = list(result)

    if len(result) == 1:
        return result[0]

    return result

def rotate(imagepath):
    orientation_flag = shell_cmd(
        ['identify', '-format', '"%[EXIF:Orientation]"', imagepath]
    )    
    orientation_flag = orientation_flag.replace('"', '')
    orientation_flag = int(orientation_flag)
    rotatation = ROTATION[orientation_flag]

    result = shell_cmd(
        #['convert', imagepath, '-auto-orient', '-rotate', str(rotatation), imagepath]
        #['convert', imagepath, '-auto-orient', imagepath]
        ['mogrify', '-auto-orient', imagepath]
    )
    print('Rotate {0}° {1}'.format(rotatation, imagepath))

#imagepath = '/home/thorgeir/testing_jpg/a/IMG_8123.JPG'
rotate('/home/thorgeir/Pictures/from_camera/2019/2019_04_27/IMG_7847.JPG')

def run(imagedir, fileformat='JPG'):
    for filepath in os.listdir(imagedir):
        if not "7798" in filepath:
            continue

        if filepath.lower().endswith(fileformat.lower()):
            rotate('{0}/{1}'.format(imagedir, filepath))
            break

        
#run('/home/thorgeir/testing_jpg/facebook')
#run('/home/thorgeir/Pictures/from_camera/2019/2019_04_27')

