![Logo](https://github.com/user-attachments/assets/2565a009-a5ce-4eab-9046-08585bd11563)


1. User push ke repo github
2. buat webhook dari github ke jenkis, triger dari branch main
3. buat credential docker login di jenkins (kredensial dockerhub-credentials)
4. lalu di jenkins akan ada 2 stage yang dimana
5. stage 1 ada build dan push ke docker registry
6. stage 2 deploy ke kubernetes menggunakan helm ( helm repo add, helm repo update, helm upgrade )

