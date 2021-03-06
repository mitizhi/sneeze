defmodule Sneeze.Internal do

  def void_tags() do
    [:area, :base, :br, :col, :command, :embed, :hr,
     :img, :input, :keygen, :link, :meta, :param,
     :source, :track, :wbr]
  end

  def is_void_tag?(tag) do
    Enum.member? void_tags(), tag
  end

  def attributes_to_string(attrib_map) do
    Enum.map(attrib_map, fn({k,v}) -> "#{k}=\"#{v}\"" end)
    |> Enum.join(" ")
  end

  def render_opening_tag(tag_name) do
    "<#{tag_name}>"
  end

  def render_opening_tag(tag_name, attribs) do
    attrib_string = attributes_to_string(attribs)
    "<#{tag_name} #{attrib_string}>"
  end

  def render_closing_tag(tag_name) do
    "</#{tag_name}>"
  end

  def render_void_tag(tag_name) do
    "<#{tag_name} />"
  end

  def render_void_tag(tag_name, attribs) do
    attrib_string = attributes_to_string(attribs)
    "<#{tag_name} #{attrib_string} />"
  end

  def render_tag(tag) do
    render_opening_tag(tag) <> render_closing_tag(tag)
  end

  def render_tag(tag, attributes) do
    render_opening_tag(tag, attributes) <> render_closing_tag(tag)
  end

end
