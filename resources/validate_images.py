import os

from util import grep

used_images = list(sorted(set(grep("\w+\.svg(?=')", "../lib", '.dart'))))
images = list(sorted(os.listdir('../assets/images')))
diff = [item for item in images if item not in used_images
        ] + [item for item in used_images if item not in images]
if len(diff) != 0:
    raise Exception(diff)
