# BarrierClip

Petit projet OpenSCAD fournissant un clip/attache (« Barrier Clip ») paramétrique conçu pour impression 3D.
Premier projet.  Rien n'est bien organise.  Ca me cause de l'urticaire.

## Contenu
- `barrierclip.scad` : fichier source OpenSCAD principal.

## Prérequis
- OpenSCAD (version recommandée : 2019.05 ou supérieure)
- Logiciel d'impression 3D pour trancher le STL (PrusaSlicer, Cura, etc.)

## Utilisation
1. Ouvrir `barrierclip.scad` dans OpenSCAD.
2. Ajuster les paramètres en haut du fichier (dimensions, épaisseur, tolérances) selon vos besoins.
3. Appuyer sur "Render" (F6) pour visualiser la pièce.
4. Exporter en STL via `File → Export → Export as STL`.

### Ligne de commande
Pour exporter directement en STL depuis la ligne de commande :

```bash
openscad -o barrierclip.stl barrierclip.scad
```



---

Fichier source : `barrierclip.scad`