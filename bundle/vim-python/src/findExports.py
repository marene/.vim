try:
    import markdown
    import vim
    import string

    def findExports():
        current_buf = vim.current.buffer


except ImportError as e:
    print(e)
    print("Markdown package not installed, please run: pip install markdown")
