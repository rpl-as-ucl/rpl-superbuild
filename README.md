# rpl-superbuild
RPL Superbuild

The RPL superbuild will be built periodically by Travis CI and every time a push happens.  If you do not want trigger Travis CI put [ci skip] in the commit comment.

Installation instructions can be found under the wiki page: [installation](https://github.com/rpl-as-ucl/rpl-superbuild/wiki)

## Catkin Organization
### RPL Franka Emika Panda in Simulation
```bash
git clone https://github.com/rpl-as-ucl/panda_simulator.git
git clone https://github.com/rpl-as-ucl/franka_ros.git
git clone https://github.com/rpl-as-ucl/panda_moveit_config.git 
```

### RPL Summit-XL Steel in Simulation
```bash
git clone https://github.com/rpl-as-ucl/robotnik_msgs.git
git clone https://github.com/rpl-as-ucl/robotnik_sensors.git
git clone https://github.com/rpl-as-ucl/summit_xl_common.git
git clone https://github.com/rpl-as-ucl/summit_xl_sim.git
```
