
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse

# TODO
# The main idea is to let the enemies spawn, let the player
# kill as much as needed enemies and once the amoun is accomplished 
# the platfom is activated and the player could up to the goalfor how to create a verse device.

# A Verse-authored creative device that can be placed in a level
platform_mover_device := class(creative_device):

    #This would be the code

    #getting the platform wich is a creative prop object
    #
    @editable
    var platform : creative_prop = creative_prop{}
    
    #This is the tracker device that will be used to track the enemies killed
    @editable
    var enemyTracker : tracker_device = tracker_device{}


    # This looks like python, this is a comment
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        # Start
        Print("Hello, world!")

        # TODO: TEst Moving the platform up and down
        #Transform:= platform.GetTransform()
        #Position:= Transform.Translation
        #Print("Position = {Position.X}{Position.Y}{Position.Z}")
        #Move the platform up by 100 units
        #platform.MoveTo(vector3{X:=Position.X, Y:=Position.Y, Z:=Position.Z + 1000.0}, Transform.Rotation, 5.0)

        # Here I'll got the tracker complete event and call the RaisePlatform function
        # but using another function of type agent void, inside that function
        # now I can call the RaisePlatform function that will move the platform up
        enemyTracker.CompleteEvent.Subscribe(RunEvent)

    RunEvent(Agent: agent): void=
        spawn:
            RaisePlatform()

    #Suspends allows to wait for an event to run this code
    # In this case the use of MoveTo needs the suspends to work.
    RaisePlatform() <suspends>: void =
        Transform:= platform.GetTransform()
        Position:= Transform.Translation

        Print("Position = {Position.X}{Position.Y}{Position.Z}")
        
        #Move the platform up by 3000 units
        platform.MoveTo(vector3{X:=Position.X, Y:=Position.Y, Z:=Position.Z + 4000.0}, Transform.Rotation, 20.0)