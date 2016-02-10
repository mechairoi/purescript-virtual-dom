## Module VirtualDOM

#### `PatchObject`

``` purescript
data PatchObject :: *
```

##### Instances
``` purescript
Show PatchObject
```

#### `createElement`

``` purescript
createElement :: VTree -> Node
```

#### `diff`

``` purescript
diff :: VTree -> VTree -> PatchObject
```

#### `patch`

``` purescript
patch :: forall e. PatchObject -> Node -> Eff (dom :: DOM | e) Node
```


