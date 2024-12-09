from library.utils import logger
from art import *   # https://pypi.org/project/art/
if __name__ == '__main__':
    Art = text2art("art")
    print(Art)
    logger.warning("<r>Starting...</r>")
    print("Starting...")
    logger.debug("Ending...")
    print("Ending...")
