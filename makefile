# Standard basis u
cli-expand-glb:
	gltf-helper expand-glb Assets/StreamingAssets/samples/Avocado/asset.glb

# Standard basis u
cli-convert-glb:
	gltf-helper convert \
			Assets/StreamingAssets/samples/Avocado/asset.glb \
			Assets/StreamingAssets/samples/Scifi_gun/asset.glb \
			Assets/StreamingAssets/samples/Skull_salazar/asset.glb \
			Assets/StreamingAssets/samples/Stylized_gladiator/asset.glb \
			Assets/StreamingAssets/samples/Viking_room/asset.glb \
			Assets/StreamingAssets/samples/Villanovan_village/asset.glb \
		-bf "-y_flip" \
		--tag basisutest

# Standard draco
cli-convert-glb-draco:
	gltf-pipeline -i Assets/StreamingAssets/samples/Avocado/asset.glb -o Assets/StreamingAssets/samples/Avocado/asset-draco.glb -d
	gltf-pipeline -i Assets/StreamingAssets/samples/Scifi_gun/asset.glb -o Assets/StreamingAssets/samples/Scifi_gun/asset-draco.glb -d
	gltf-pipeline -i Assets/StreamingAssets/samples/Skull_salazar/asset.glb -o Assets/StreamingAssets/samples/Skull_salazar/asset-draco.glb -d
	gltf-pipeline -i Assets/StreamingAssets/samples/Stylized_gladiator/asset.glb -o Assets/StreamingAssets/samples/Stylized_gladiator/asset-draco.glb -d
	gltf-pipeline -i Assets/StreamingAssets/samples/Viking_room/asset.glb -o Assets/StreamingAssets/samples/Viking_room/asset-draco.glb -d
	gltf-pipeline -i Assets/StreamingAssets/samples/Villanovan_village/asset.glb -o Assets/StreamingAssets/samples/Villanovan_village/asset-draco.glb -d

# Standard basis u x draco
cli-convert-glb-basis-draco:
	gltf-helper convert \
			Assets/StreamingAssets/samples/Avocado/asset.glb \
			Assets/StreamingAssets/samples/Scifi_gun/asset.glb \
			Assets/StreamingAssets/samples/Skull_salazar/asset.glb \
			Assets/StreamingAssets/samples/Stylized_gladiator/asset.glb \
			Assets/StreamingAssets/samples/Viking_room/asset.glb \
			Assets/StreamingAssets/samples/Villanovan_village/asset.glb \
		-bf "-y_flip" \
		-gf "--draco.compressMeshes" \
		-gf "--separate" \
		--tag basisu-draco

# -comp_level 2
cli-convert-glb-comp2:
	gltf-helper convert \
			Assets/StreamingAssets/samples/Avocado/asset.glb \
			Assets/StreamingAssets/samples/Scifi_gun/asset.glb \
			Assets/StreamingAssets/samples/Skull_salazar/asset.glb \
			Assets/StreamingAssets/samples/Stylized_gladiator/asset.glb \
			Assets/StreamingAssets/samples/Viking_room/asset.glb \
			Assets/StreamingAssets/samples/Villanovan_village/asset.glb \
		-bf "-comp_level" -bf "2" -bf "-y_flip"\
		--tag comp2 -vv

# --global_sel_pal
cli-convert-glb-global_sel_pal:
	gltf-helper convert \
			Assets/StreamingAssets/samples/Avocado/asset.glb \
			Assets/StreamingAssets/samples/Scifi_gun/asset.glb \
			Assets/StreamingAssets/samples/Skull_salazar/asset.glb \
			Assets/StreamingAssets/samples/Stylized_gladiator/asset.glb \
			Assets/StreamingAssets/samples/Viking_room/asset.glb \
			Assets/StreamingAssets/samples/Villanovan_village/asset.glb \
		-bf "-global_sel_pal" -bf "-y_flip"\
		--tag gsp -vv

# max quality 
cli-convert-glb-maxq:
	gltf-helper convert \
			Assets/StreamingAssets/samples/Avocado/asset.glb \
			Assets/StreamingAssets/samples/Scifi_gun/asset.glb \
			Assets/StreamingAssets/samples/Skull_salazar/asset.glb \
			Assets/StreamingAssets/samples/Stylized_gladiator/asset.glb \
			Assets/StreamingAssets/samples/Viking_room/asset.glb \
			Assets/StreamingAssets/samples/Villanovan_village/asset.glb \
		-bf "-global_sel_pal" \
		-bf "-y_flip" \
		-bf "-comp_level" -bf "5" \
		-bf "-max_endpoints" -bf "16128" \
		-bf "-max_selectors" -bf "16128" \
		-bf "-no_selector_rdo" \
		-bf "-no_endpoint_rdo" \
		--tag maxq -vv