try:
    import markdown
    import vim
    import string

    html = vim.current.buffer.append("\n")

except ImportError as e:
    print(e)
    print("Markdown package not installed, please run: pip install markdown")
