module VirtualDOM
  ( PatchObject()
  , createElement
  , diff
  , patch
  ) where

import Prelude
import Control.Monad.Eff
import Data.Function
import DOM
import DOM.Node.Types (Node)
import VirtualDOM.VTree

-- PatchObject represents an Array<VPatch>, where each VPatch is a patch
-- operation.  See virtual-dom/docs.jsig for details.
foreign import data PatchObject :: *

foreign import showPatchObjectImpl :: PatchObject -> String

instance showPatchObject :: Show PatchObject where
  show = showPatchObjectImpl

foreign import createElement :: VTree -> Node

foreign import diff_ :: Fn2 VTree VTree PatchObject

diff :: VTree -> VTree -> PatchObject
diff = runFn2 diff_

foreign import patch_ :: forall e. Fn2 Node PatchObject (Eff (dom :: DOM | e) Node)

patch :: forall e. PatchObject -> Node -> Eff (dom :: DOM | e) Node
patch p n = runFn2 patch_ n p
