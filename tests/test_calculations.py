import pytest


def test_ejemplo_cotizacion():
  subtotal = 100.0
  impuesto = 0.16
  total = subtotal * (1 + impuesto)

  # pytest.approx maneja los imprecisiones de punto flotante
  assert total == pytest.approx(116.0)


def test_redondeo_cotizacion():
  subtotal = 100.0
  impuesto = 0.16
  total = round(subtotal * (1 + impuesto), 0)

  assert total == 116.0