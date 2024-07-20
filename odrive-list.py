#!/usr/bin/env python3

# import odrive
# import math


# dev0 = odrive.find_any()

# # import odrive.enums.MotorType as MotorType
# from odrive.enums import MotorType, AxisState, ControlMode
# pole_pairs = 7
# motor_kv = 340

# dev0.axis0.controller.config.vel_gain = 0.01
# dev0.axis0.controller.config.vel_integrator_gain = 0.05
# dev0.axis0.controller.config.control_mode = ControlMode.VELOCITY_CONTROL
# dev0.axis0.controller.config.vel_limit = dev0.axis0.config.sensorless_ramp.vel / (2 * math.pi * pole_pairs) + 10
# dev0.axis0.config.sensorless_ramp.current = 20.0
# dev0.axis0.motor.config.current_lim = 2 * dev0.axis0.config.sensorless_ramp.current
# dev0.axis0.sensorless_estimator.config.pm_flux_linkage = 5.51328895422 / pole_pairs * motor_kv
# dev0.axis0.config.enable_sensorless_mode = True
# dev0.config.enable_brake_resistor = True
# dev0.axis0.motor.config.motor_type = MotorType.HIGH_CURRENT
# dev0.axis0.motor.config.pole_pairs = pole_pairs
# # dev0.axis0.requested_state = AxisState.MOTOR_CALIBRATION
# dev0.axis0.requested_state = AxisState.FULL_CALIBRATION_SEQUENCE
# print(str(dev0.vbus_voltage))

# import math

pole_pairs = 7
motor_kv = 340
dev0.axis0.controller.config.vel_gain = 0.01
dev0.axis0.controller.config.vel_integrator_gain = 0.05
dev0.axis0.controller.config.control_mode = CONTROL_MODE_VELOCITY_CONTROL
dev0.axis0.controller.config.vel_limit = dev0.axis0.config.sensorless_ramp.vel / (2 * math.pi * pole_pairs) + 10
dev0.axis0.motor.config.current_lim = 2 * dev0.axis0.config.sensorless_ramp.current
dev0.axis0.sensorless_estimator.config.pm_flux_linkage = 5.51328895422 / pole_pairs * motor_kv
dev0.axis0.config.enable_sensorless_mode = True
dev0.config.enable_brake_resistor = True
dev0.clear_errors()
dev0.axis0.requested_state = AXIS_STATE_FULL_CALIBRATION_SEQUENCE


dev0.axis0.requested_state = AXIS_STATE_CLOSED_LOOP_CONTROL



# dev0.axis0.trap_traj.config.accel_limit = 1000.0
# dev0.axis0.trap_traj.config.decel_limit = 1000.0
# dev0.axis0.controller.config.input_mode = INPUT_MODE_TRAP_TRAJ
# dev0.axis0.controller.input_pos = 10
