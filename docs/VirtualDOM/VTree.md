## Module VirtualDOM.VTree

#### `VTree`

``` purescript
data VTree :: Prim.Type
```

##### Instances
``` purescript
Show VTree
```

#### `TagName`

``` purescript
type TagName = String
```

#### `vnode`

``` purescript
vnode :: forall props. TagName -> {  | props } -> Array VTree -> VTree
```

#### `vtext`

``` purescript
vtext :: String -> VTree
```

#### `widget`

``` purescript
widget :: forall props. {  | props } -> VTree
```

#### `thunk`

``` purescript
thunk :: (Maybe VTree -> VTree) -> VTree
```

#### `VHook`

``` purescript
data VHook :: Prim.Type
```

##### Instances
``` purescript
Show VHook
```

#### `vhook`

``` purescript
vhook :: forall props. {  | props } -> VHook
```


