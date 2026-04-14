
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
platform_mover_device := class(creative_device):

    #This would be the code

    #getting the platform
    @editable
    var platform : creative_prop = creative_prop{}


    # This looks like python, this is a comment
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        Print("Hello, world!")

        Transform:= platform.GetTransform()
        Position:= Transform.Translation

        Print("Position = {Position.X}{Position.Y}{Position.Z}")

        #Move the platform up by 100 units

        platform.MoveTo(vector3{X:=Position.X, Y:=Position.Y, Z:=Position.Z + 5000.0}, Transform.Rotation, 10.0)