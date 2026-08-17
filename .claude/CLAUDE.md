# Guidelines

## Git Workflow

Generally speaking, you are free to execute read operations (`log`, `show`,
`diff`, etc.) Write operations (`commit`, `push`, `checkout`) are the user's
responsiblity.

When making changes, pause frequently for the user to review and commit them.

The above guildelines in this section may be superseded by instructions from the
user.

## Comments

Be highly selective about the comments and docstrings you right. Comments need
to earn their keep. And an incorrect comment is worse than no comment at all.
Well-written code is self-documenting.

Avoid the following:

1. Comments that repeat what the code says.
2. Comments that talk about other parts of the codebase, like a function
   docstring that talks about how/where the function is called. Such information
   is likely to become outdated.
3. Historical, path-dependent comments. Document the current state of the code,
   not how we got here. If this sort of documentation is truly important, it's
   better to put it in a commit message.

Existing comments may violate these rules. That is not license for you to
violate them.

## Python Commands and Dependencies

Use `uv` for all Python commands. Do not use the system's Python interpreter.

Similarly, use `uv` to install dependencies.
When inside a project with a `pyproject.toml` file, use `uv add`.
Otherwise, use `uv --with=<package>`. Never use `pip` directly.
