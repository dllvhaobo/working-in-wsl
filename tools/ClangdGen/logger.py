
import logging

logging.basicConfig(level=logging.ERROR, format='[%(asctime)s %(levelname)s %(filename)s:%(lineno)-4d ]%(funcName)s(): %(message)s')
logger = logging.getLogger(__name__)
