package Mason::PluginBundle;
$Mason::PluginBundle::VERSION = '2.22';
use Mason::PluginRole;

method expand_to_plugins ($bundle_class:) {
    return Mason::PluginManager->process_plugin_specs( [ $bundle_class->requires_plugins ] );
}

requires 'requires_plugins';

1;
