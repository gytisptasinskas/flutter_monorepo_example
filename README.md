# Flutter Monorepo Example

This is a Flutter monorepo managed with Melos.

## Structure

- `/app` - Flutter applications
- `/feature` - Feature modules
- `/package` - Shared packages
- `/utility` - Utility packages

## Getting Started

### Prerequisites

1. Flutter SDK
2. Melos: `dart pub global activate melos`

### Setup

1. Clone the repository
2. Run `melos bootstrap` to link local packages

### Available Commands

- `melos analyze` - Analyze all packages
- `melos format` - Format all packages
- `melos test` - Run all tests