project_type = :rails

config = Compass::Configuration::Data.new("engine config")
config.sprite_load_path << File.join(File.expand_path('../../', __FILE__), '..', 'app', 'assets', 'images')
config.generated_images_dir = 'app/assets/images'
config.relative_assets = false
Compass.add_configuration(config)