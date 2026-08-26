# Guidelines

## Git Workflow

You are free to execute read operations (`log`, `show`, `diff`, etc.) Write
operations (`commit`, `push`, `checkout`) are the user's responsiblity.

Work in atomic changes. Pick one idea per commit: one signature, one behavior,
one rename Pause after each one for the user to review and commit.

Do not batch changes by edit site. While you have a file or a function open,
make only the change the current commit is about, even when you can see other
changes it will eventually need. Two unrelated edits to one file are two
commits. Ten files expressing one idea are one commit.

Specifics:

1. Renames, moves, and reformatting never share a commit with a behavior change.
2. Add a function, class or dependency in the commit that first uses it. Remove
   it in the commit after its last use.
3. Optimize for reviewabilty, not tool efficiency. Editing the same file across
   five successive commits is expected and fine.

The above guildelines in this section may be superseded by instructions from the
user.

## Comments

Be highly selective about the comments and docstrings you write. Comments need
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

## Scratchpad

Files in the scratchpad are not easily discoverable by the user. Prefer to put
deliverables in the project folder. When sharing files from the scratchpad,
include full path so the user can easily open them.
