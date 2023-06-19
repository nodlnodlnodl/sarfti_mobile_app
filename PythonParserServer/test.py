import pytest
from parsersarfti import parserNews


result = parserNews()


def find_html_tags_in_dict(result):
    html_tags = ["<html>", "<head>", "<body>", "<div>", "<span>", "<p>", "<h1>", "<h2>", "<h3>", "<h4>", "<h5>", "<h6>",
                 "<a>", "<img>"]

    found_tags = []
    for item in result:
        for key, value in item.items():
            if any(tag in str(value) for tag in html_tags):
                found_tags.append((key, value))

    if found_tags:
        raise ValueError("HTML tags found in the dictionary: {}".format(found_tags))



def test_parserNews(result):
    with pytest.raises(ValueError) as excinfo:
        find_html_tags_in_dict(result)
    assert "HTML tags found in the dictionary" in str(excinfo.value)