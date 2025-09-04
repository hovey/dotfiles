# Project Guidelines

## General Instructions for Python Code:

- All Python code MUST adhere to PEP 8 style guide.
- Use 4 spaces for indentation.
- Variable names should be `snake_case`.
- Function names should be `snake_case`.
- Function names should be declarative, not imperative.
- Function names should be noun-based, not verb-based.
- Test functions should be named `test_` followed by the name of the function being tested (e.g., `test_get_score_from_summary`).
- Use a functional programming style; do not use an object-oriented programming style.
- Class names should be `CamelCase`.
- Include Google-style docstrings for all functions and classes explaining their purpose, arguments, and return values.
- Use type hints for all variables, including `typing.Final` for constants.
- Use keyword arguments.
- Use NamedTuples and create immutable types when possible.
- Do not use unittest; use only pytest.
- For testing and test-driven design (TDD), follow the red-green-refactor cycle.
- Opening test files should always specify encoding="utf8", for exmaple, with this line of code: with open(mock_github_env_file, "r", encoding="utf8") as f:

## Code Clarity and Robustness:

- Prioritize clear and simple function signatures and logic.
- Use modern Python features, like `match` statements, to improve readability where appropriate.
- Ensure robust error handling, making sure all possible error cases are handled gracefully.
- Maintain a clean code style by removing unused imports.

## Educational Context:

- When generating or explaining code, prioritize clarity and simplicity, suitable for beginners learning Python.
- Explain concepts thoroughly, as if teaching a student.
- Avoid overly complex one-liners unless specifically requested.
- Focus on core Python principles before introducing advanced libraries.

## Forbidden Actions:

- DO NOT suggest or use `eval()` or `exec()` functions unless explicitly asked for in a secure context demonstration.
- DO NOT recommend external libraries without first discussing their purpose and alternatives with the user.
- DO NOT generate code that requires network access without explicit user permission.
- DO NOT modify files without explicit confirmation from the user.

## Preferred Tools & Workflows:

- When providing solutions, favor using Python's standard library where possible.
- If suggesting a fix for a bug, first explain the root cause clearly.
- For file operations, always confirm with the user before reading or writing.
