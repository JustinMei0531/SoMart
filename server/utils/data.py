
def json_content_check(obj, *args):
    assert isinstance(obj, dict)
    for key in args:
        if key not in obj:
            return False
    return True
