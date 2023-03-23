
import logging
import coloredlogs

logging.basicConfig(level=logging.ERROR, format='[%(asctime)s %(levelname)s %(filename)s:%(lineno)-4d ]%(funcName)s(): %(message)s')
logger = logging.getLogger(__name__)

coloredlogs.install(level='DEBUG', logger=logger,
                    fmt='%(asctime)s %(levelname)s %(message)s',
                    level_styles={
                        'debug': {'color': 'green'},
                        'info': {'color': 'blue'},
                        'warning': {'color': 'yellow'},
                        'error': {'color': 'red'},
                        'critical': {'color': 'red', 'bold': True}
                    })
