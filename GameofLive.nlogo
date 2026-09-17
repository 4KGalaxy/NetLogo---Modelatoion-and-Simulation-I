patches-own [new-color]
to setup 
  clear-all
  reset-ticks
  ask patches [
  set pcolor one-of [gray blue] ;; gris muerto, azul vivo
  ]
end 

to go
  tick 
  ask patches [
  let count-alive count (neighbors with [pcolor = blue])
    set new-color pcolor
    
    if-else (pcolor = blue)
    [if (count-alive < 2 or count-alive > 3)
    [set new-color gray]
    ]
   [if (count-alive = 3)
    [set new-color blue]
    ]
  ]
  
  ask patches [set pcolor new-color]
end
