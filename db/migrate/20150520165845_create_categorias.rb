#encoding: utf-8
class CreateCategorias < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string :nome, limit: 100
      t.timestamps
    end

    Categoria.create([
      {:nome => "Persianas"},
      {:nome => "Pisos Laminados"},
      {:nome => "Cortinas"},
      {:nome => "Persianas"}
    ])
  end
end