defmodule ExI18n.LoaderTest do
  use ExUnit.Case
  doctest ExI18n.Loader

  test "loader_type/0" do
    assert ExI18n.Loader.loader_type() == :yml
  end

  test "options/0" do
    assert ExI18n.Loader.options() == %{path: "test/fixtures"}
  end

  test "get/1 returns loader module based on type" do
    assert ExI18n.Loader.get(:yml) == ExI18n.Loader.YAML
    assert ExI18n.Loader.get(:http) == ExI18n.Loader.HTTP
    assert ExI18n.Loader.get(:custom_loader) == :custom_loader
  end

  test "load/1 returns loaded translations for locale" do
    assert is_map(ExI18n.Loader.load("en"))
  end

  test "load/1 returns error on missing translations" do
    assert_raise ArgumentError, fn ->
      ExI18n.Loader.load("invalid")
    end
  end
end
