defmodule GildedRoseTest do
  use ExUnit.Case

  # test "begin the journey of refactoring" do
  #   items = [%Item{name: "foo", sell_in: 0, quality: 0}]
  #   GildedRose.update_quality(items)
  #   %{name: firstItemName} = List.first(items)
  #   assert "fixme" == firstItemName
  # end

  test "Quality of an item is never negative" do
    items = [%Item{name: "foo", sell_in: 0, quality: 0}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 0 == firstItemQuality
  end

  test "Quality of an item is never more than 50" do
    items = [%Item{name: "Aged Brie", sell_in: 0, quality: 50}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 50 == firstItemQuality
  end

  test "Quality of an item decreases by 1" do
    items = [%Item{name: "foo", sell_in: 0, quality: 1}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 0 == firstItemQuality
  end

  test "Quality of an item decreases twice as fast after sell by date" do
    items = [%Item{name: "foo", sell_in: 0, quality: 2}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 0 == firstItemQuality
  end

  test "Aged Brie increases in quality" do
    items = [%Item{name: "Aged Brie", sell_in: 2, quality: 0}]

    %{name: firstItemName, quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert "Aged Brie" == firstItemName
    assert 1 == firstItemQuality
  end

  test "Aged Brie increases in quality twice as fast after sell by date" do
    items = [%Item{name: "Aged Brie", sell_in: 0, quality: 0}]

    %{name: firstItemName, quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert "Aged Brie" == firstItemName
    assert 2 == firstItemQuality
  end

  test "Sulfuras never decreases in quality" do
    items = [%Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 80}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 80 == firstItemQuality
  end

  test "Backstage passes increases in quality" do
    items = [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 15, quality: 20}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 21 == firstItemQuality
  end

  test "Backstage passes increases in quality by 2 when there are 10 days or less" do
    items = [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 20}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 22 == firstItemQuality
  end

  test "Backstage passes increases in quality by 3 when there are 5 days or less" do
    items = [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 20}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 23 == firstItemQuality
  end

  test "Backstage passes quality drops to 0 after the concert" do
    items = [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 20}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 0 == firstItemQuality
  end

  test "Conjured items degrade in quality twice as fast as normal items" do
    items = [%Item{name: "Conjured", sell_in: 1, quality: 4}]

    %{quality: firstItemQuality} =
      GildedRose.update_quality(items)
      |> List.first()

    assert 2 == firstItemQuality
  end
end
