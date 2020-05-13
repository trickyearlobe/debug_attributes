# debug_attributes

Ever been frustrated by a bunch of Chef cookbooks which are linked in complex ways with complex attribute precedence?

Ever had to fill those cookbooks with Log and Pry statements to track down the culprit?

If so, this cookbook may be for you.
It installs an event handler so it can notify you each time an attribute is set.
Don't worry, it doesn't log the initial OHAI automatic attribute set

## Usage
Add `debug_attributes` to your runlist (No settings to set, no default recipe to call)
Run your code and get output like this

```
Starting Chef Infra Client, version 16.0.287
Using policy 'debug_attributes' at revision 'c0ea3d7128c801cf1fedd3ee539de091d3c629c3618be3580eb56a5c29908490'
resolving cookbooks for run list: ["debug_attributes_test::default@0.1.0 (138e5eb)"]
Synchronizing Cookbooks:
  - debug_attributes (0.1.0)
  - debug_attributes_test (0.1.0)
Installing Cookbook Gems:
Compiling Cookbooks...
[2020-05-13T21:26:50+00:00] WARN: ----------------------------------------------
[2020-05-13T21:26:50+00:00] WARN: | Registering attribute event handler        |
[2020-05-13T21:26:50+00:00] WARN: ----------------------------------------------
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   default["debug_attributes_test"]={}
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/attributes/default.rb:1:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   default["debug_attributes_test", "test_attribute"]=Initial set at default level
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/attributes/default.rb:1:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   default["debug_attributes_test", "test_attribute"]=Second set at default level
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/attributes/default.rb:2:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   default["debug_attributes_test", "test_attribute"]=Third set at default level
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:7:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   normal["debug_attributes_test", "test_attribute"]=Fourth set at normal level
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:8:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   override["debug_attributes_test"]={}
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:9:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   override["debug_attributes_test", "test_attribute"]=Fifth set at override level
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:9:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   normal["debug_attributes_test", "test_attribute"]=Sixth set at normal level
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:10:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   default["sasquatch"]={}
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes/recipes/default.rb:7:in `from_file'
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:12:in `from_file'
[2020-05-13T21:26:50+00:00] WARN: Attribute changed:
[2020-05-13T21:26:50+00:00] WARN:   default["sasquatch", "tracker"]=crazy
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes/recipes/default.rb:7:in `from_file'
[2020-05-13T21:26:50+00:00] WARN:   /tmp/kitchen/cache/cookbooks/debug_attributes_test/recipes/default.rb:12:in `from_file'
Converging 0 resources

Running handlers:
Running handlers complete
Chef Infra Client finished, 0/0 resources updated in 01 seconds
Downloading files from <default-centos-7>
Finished converging <default-centos-7> (0m9.02s).
```
