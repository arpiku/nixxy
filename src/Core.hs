-- Core set of abilities load when nixxy inits
module Core where


import NixxySay
import qualified Turtle 


saySomething:: IO()
saySomething = NixxySay.nixxySay

sayHelloFirstTime = saySomething "Hello I am nixxy, Here to help!"

-- ifNotVault -- ask for permission to create vault

  -- isVaultOpen :: Void -> Nixxy

-- getVault
-- initVault



