---
description: generating demonstrative python examples
allowed-tools: Bash(mkdir:*), Bash(uv:*), mcp__Ref__ref_search_documentation, mcp__Ref__ref_read_url
---

# Python Examples Generator

Generate concise, demonstrative Python code examples for specified libraries (`$ARGUMENTS`)

## Requirements

1. **Project Setup**: Use `uv` for dependency management
   - Run `uv init` to initialize new projects
   - Use `uv add <package>` to install dependencies
   - Use `uv run` to run python script

2. **Code Standards**:
   - Create minimal, focused examples that demonstrate core functionality
   - Prioritize reusability and clarity over comprehensiveness
   - Include only essential imports and code
   - Add brief inline comments for complex operations
   - Use ref to look up relevant samples and docs.

3. **Example Structure**:
   - Start with basic usage patterns
   - Progress to common real-world scenarios
   - Include error handling where appropriate
   - Demonstrate best practices for the library

4. **Documentation**:
   - Should be concise
   - Focus on high level concepts, with descriptions of implementation
   - Explain the "why" behind key design decisions


Focus on creating examples that developers can quickly understand and adapt for their own use.
