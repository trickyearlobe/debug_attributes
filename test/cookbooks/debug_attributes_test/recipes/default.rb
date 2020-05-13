#
# Cookbook:: debug_attributes_test
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Cookstyle recommends removing node. from attributes, but that doesnt work in recipes (at least not on CC 16.0.287)
# My guess is the rule is for attribute files, and someone forgot that attributes can be set in recipes too.
# rubocop:disable ChefCorrectness/NodeNormal
node.default['debug_attributes_test']['test_attribute'] = 'Third set at default level'
node.normal['debug_attributes_test']['test_attribute'] = 'Fourth set at normal level'
node.override['debug_attributes_test']['test_attribute'] = 'Fifth set at override level'
node.normal['debug_attributes_test']['test_attribute'] = 'Sixth set at normal level'
node.normal['squirrels'] = 32
node.normal['array'] = [1, 3, 5, 7, 9]
node.normal['hash'] = { name: 'Richard', hobby: 'beer' }
# rubocop:enable ChefCorrectness/NodeNormal
