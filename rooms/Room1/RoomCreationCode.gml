var tile_width = 64; // Ширина плитки
var tile_height = 64; // Высота плитки

// Список индексов, которые не нужно обрабатывать
var excluded_tiles = [0, 213]; // Тайлы с индексами 0, 5 и 7 будут пропущены

// Получаем тайлмап с этого слоя
var tilemap = layer_tilemap_get_id("Collisions1");

var width = tilemap_get_width(tilemap);  // Ширина тайлмапа в клетках
var height = tilemap_get_height(tilemap); // Высота тайлмапа в клетках

// Проходим по всем клеткам тайлмапа
for (var tile_y = 0; tile_y < height; tile_y++) {
    for (var tile_x = 0; tile_x < width; tile_x++) {
        var tile_index = tilemap_get(tilemap, tile_x, tile_y);  // Получаем индекс плитки на клетке
        
        // Выводим индекс плитки в консоль
        show_debug_message("Tile Index at (" + string(tile_x) + ", " + string(tile_y) + ") = " + string(tile_index));
        
        // Проверяем, находится ли индекс плитки в списке исключений
        var skip = false; 
        for (var i = 0; i < array_length(excluded_tiles); i++) {
            if (tile_index == excluded_tiles[i]) {
                skip = true;
                break; // Пропускаем, если плитка в списке
            }
        }
        
        if (!skip) {  // Если плитка не в списке исключений
            instance_create_layer(tile_x * tile_width, tile_y * tile_height, "Instances", oWall_1);
        }
    }
}
