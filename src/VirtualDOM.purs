module VirtualDOM
  ( PatchObject()
  , createElement
  , diff
  , patch
  ) where

import Prelude (class Show)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import DOM.Node.Types (Node)
import VirtualDOM.VTree (VTree)

-- PatchObject represents an Array<VPatch>, where each VPatch is a patch
-- operation.  See virtual-dom/docs.jsig for details.
foreign import data PatchObject :: Type

foreign import showPatchObjectImpl :: PatchObject -> String

instance showPatchObject :: Show PatchObject where
  show = showPatchObjectImpl

foreign import createElement :: VTree -> Node

foreign import diff :: VTree -> VTree -> PatchObject

foreign import patch :: forall e. PatchObject -> Node -> Eff (dom :: DOM | e) Node
