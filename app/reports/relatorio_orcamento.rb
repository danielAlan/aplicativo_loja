#encoding: utf-8
class RelatorioOrcamento < RelatorioBase

  def insert_content(resources, filtro_hash)
    bounding_box([20, 600], :width =>500, :height =>550) do
      stroke_bounds
      text " . " * 1950
    end
  end

  def titulo
    "Orçamento"
  end
end