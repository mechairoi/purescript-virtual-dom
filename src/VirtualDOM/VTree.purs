module VirtualDOM.VTree
  ( VTree()
  , VHook()
  , TagName()
  , vnode
  , vtext
  , widget
  , thunk
  , vhook
  ) where

import Prelude (class Show)
import Data.Maybe (Maybe(Just, Nothing))

foreign import data VTree :: *

foreign import showVTreeImpl :: VTree -> String

instance showVTree :: Show VTree where
  show = showVTreeImpl

type TagName = String

foreign import vnode :: forall props. TagName -> { | props} -> Array VTree -> VTree

foreign import vtext :: String -> VTree

foreign import widget :: forall props. { | props} -> VTree

foreign import thunk_ :: (Maybe VTree -> VTree)
                      -> Maybe VTree
                      -> (VTree -> Maybe VTree)
                      -> VTree

-- Render a VTree using custom logic function.  The logic can examine the
-- previous VTree before returning the new (or same) one.  The result of the
-- render function must be a vnode, vtext, or widget.  This constraint is not
-- enforced by the types.
thunk :: (Maybe VTree -> VTree) -> VTree
thunk render = thunk_ render Nothing Just

foreign import data VHook :: *

foreign import vhook  :: forall props. { | props } -> VHook

foreign import showVHookImpl :: VHook -> String

instance showVHook :: Show VHook where
  show = showVHookImpl
