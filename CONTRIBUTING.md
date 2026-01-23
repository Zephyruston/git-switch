# Contributing to git-switch

First off, thank you for considering contributing to git-switch! It's people like you that make git-switch such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title**
* **Describe the exact steps to reproduce the problem**
* **Provide specific examples to demonstrate the steps**
* **Describe the behavior you observed and what behavior you expected**
* **Include your configuration file** (with sensitive data removed)
* **Include your system details** (OS, Bash version, Git version)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title**
* **Provide a step-by-step description of the suggested enhancement**
* **Provide specific examples to demonstrate the steps**
* **Describe the current behavior and explain the expected behavior**
* **Explain why this enhancement would be useful**

### Pull Requests

1. Fork the repo and create your branch from `main`
2. If you've added code that should be tested, add tests
3. Ensure the script runs correctly with your changes
4. Make sure your code follows the existing style
5. Issue that pull request!

## Development Process

1. **Fork & Clone**
   ```bash
   git clone https://github.com/KaleLetendre/git-switch.git
   cd git-switch
   ```

2. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Edit `bin/git-switch` for core functionality
   - Update `README.md` if needed
   - Add examples if introducing new features

4. **Test your changes**
   ```bash
   # Test the script locally
   ./bin/git-switch
   
   # Test with different configurations
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add feature: description of your feature"
   ```

6. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line

### Bash Script Styleguide

* Use 4 spaces for indentation (no tabs)
* Use `snake_case` for variable names
* Use UPPERCASE for constants
* Always quote variables: `"$var"` not `$var`
* Use `[[ ]]` for conditionals instead of `[ ]`
* Add comments for complex logic
* Use meaningful variable names

### Documentation Styleguide

* Use Markdown for all documentation
* Reference functions and variables in backticks: `git-switch`
* Include code examples in triple backticks with language specification

## Testing

Before submitting a PR, please test:

1. **Basic functionality**: Does account switching work?
2. **Config parsing**: Does it handle various config formats?
3. **Error handling**: Does it fail gracefully with bad input?
4. **SSH config generation**: Is the generated SSH config valid?
5. **Multiple hosts**: Test with github, bitbucket, gitlab

## Additional Notes

### Issue and Pull Request Labels

* `bug` - Something isn't working
* `enhancement` - New feature or request
* `good first issue` - Good for newcomers
* `help wanted` - Extra attention is needed
* `question` - Further information is requested
* `documentation` - Improvements or additions to documentation

## Recognition

Contributors will be recognized in the README.md file. Thank you for your contributions!