import rclpy
from rclpy.node import Node

class Bspline(Node):
    def __init__(self):
        super().__init__('bspline')
        

def main():
    print('Hi from bspline.')


if __name__ == '__main__':
    main()
