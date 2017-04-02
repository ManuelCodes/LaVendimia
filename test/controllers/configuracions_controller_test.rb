require 'test_helper'

class ConfiguracionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuracion = configuracions(:one)
  end

  test "should get index" do
    get configuracions_url
    assert_response :success
  end

  test "should get new" do
    get new_configuracion_url
    assert_response :success
  end

  test "should create configuracion" do
    assert_difference('Configuracion.count') do
      post configuracions_url, params: { configuracion: { plazo_maximo: @configuracion.plazo_maximo, prc_enganche: @configuracion.prc_enganche, tasa: @configuracion.tasa } }
    end

    assert_redirected_to configuracion_url(Configuracion.last)
  end

  test "should show configuracion" do
    get configuracion_url(@configuracion)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuracion_url(@configuracion)
    assert_response :success
  end

  test "should update configuracion" do
    patch configuracion_url(@configuracion), params: { configuracion: { plazo_maximo: @configuracion.plazo_maximo, prc_enganche: @configuracion.prc_enganche, tasa: @configuracion.tasa } }
    assert_redirected_to configuracion_url(@configuracion)
  end

  test "should destroy configuracion" do
    assert_difference('Configuracion.count', -1) do
      delete configuracion_url(@configuracion)
    end

    assert_redirected_to configuracions_url
  end
end
