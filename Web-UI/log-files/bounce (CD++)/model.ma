[top]
components : rebota

[rebota]
type : cell
dim : (20,20)
delay : transport
defaultDelayTime  : 100
border : nowrapped
neighbors : rebota(-1,-1)             rebota(-1,1)
neighbors :               rebota(0,0)
neighbors : rebota(1,-1)              rebota(1,1)
initialvalue : 0
initialrowvalue : 2      00040000000000000000
initialrowvalue : 12     00000000000200000000
initialrowvalue : 13     00000000000000000010
localtransition : mover-rule
zone : esquinaUL-rule { (0,0) }
zone : esquinaUR-rule { (0,19) }
zone : esquinaDL-rule { (14,0) }
zone : esquinaDR-rule { (14,19) }
zone : top-rule { (0,1)..(0,18) }
zone : bottom-rule { (14,1)..(14,18) }
zone : left-rule { (1,0)..(13,0) }
zone : right-rule { (1,19)..(13,19) }

[mover-rule]
rule : 1 100 { (-1,-1) = 1 }
rule : 2 100 { (1,-1) = 2 }
rule : 3 100 { (-1,1) = 3 }
rule : 4 100 { (1,1) = 4 }
rule : 0 100 { t }

[top-rule]
rule : 3 100 { (1,1) = 4 }
rule : 1 100 { (1,-1) = 2 }
rule : 0 100 { t }

[bottom-rule]
rule : 4 100 { (-1,1) = 3 }
rule : 2 100 { (-1,-1) = 1 }
rule : 0 100 { t }

[left-rule]
rule : 1 100 { (-1,1) = 3 }
rule : 2 100 { (1,1) = 4 }
rule : 0 100 { t }

[right-rule]
rule : 3 100 { (-1,-1) = 1 }
rule : 4 100 { (1,-1) = 2 }
rule : 0 100 { t }

[esquinaUL-rule]
rule : 1 100 { (1,1) = 4 }
rule : 0 100 { t }

[esquinaUR-rule]
rule : 3 100 { (1,-1) = 2 }
rule : 0 100 { t }

[esquinaDL-rule]
rule : 2 100 { (-1,1) = 3 }
rule : 0 100 { t }

[esquinaDR-rule]
rule : 4 100 { (-1,-1) = 1 }
rule : 0 100 { t }


# NOTAS
# Movimientos del objeto:
#
# 0 = casillero en blanco
# 1 = objeto con direccion abajo-derecha
# 2 = objeto con direccion arriba-derecha
# 3 = objeto con direccion abajo-izquierda
# 4 = objeto con direccion abajo-derecha
