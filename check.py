import dbus

# Connect to the session bus
bus = dbus.SessionBus()

# Get the Terminator service
terminator = bus.get_object('net.tenshu.Terminator', '/net/tenshu/Terminator')

# Get the interface
iface = dbus.Interface(terminator, dbus_interface='net.tenshu.Terminator')

# Open a new tab in the default window
iface.new_tab()

