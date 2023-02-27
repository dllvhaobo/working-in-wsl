import os
import traceback
import yaml
from logger import logger


class BobInfoCache:

    def __init__(self, **kwargs) -> None:
        self.kwargs = kwargs
        self.cachefile = kwargs.get('cachefile', "")
        self.content = dict()

    def load(self):
        try:
            if (self.kwargs.get('use_cache') == True):
                if (os.path.exists(self.cachefile)):
                    self.content = yaml.full_load(
                        open(self.cachefile, 'r').read())
                else:
                    logger.info("Cache file not specified or not exist")
            else:
                logger.info("DO NOT use cachefile")

        except Exception as err:
            logger.error(str(err))
            traceback.print_exc()

    def dump(self):
        try:
            if self.kwargs.get('save_cache') == True:
                with open(self.cachefile, 'w') as f:
                    f.write(yaml.dump(self.content))
        except Exception as err:
            logger.error(str(err))
            traceback.print_exc()

    def update(self, **info):
        self.content.update(**info)

    def get(self, name=None):
        return self.content if name is None else self.content.get(name)
