import pytest

def test_always_passes():
    assert True

def test_always_fails():
    with pytest.raises(AssertionError):
        assert False
