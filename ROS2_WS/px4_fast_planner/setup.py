from setuptools import setup

package_name = 'px4_fast_planner'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='regatte',
    maintainer_email='ashok_a380@icloud.com',
    description='TODO: Package description',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'cps = px4_fast_planner.camera_pose_publisher:main',
            'tmc = px4_fast_planner.trajectory_msg_converter:main'
        ],
    },
)