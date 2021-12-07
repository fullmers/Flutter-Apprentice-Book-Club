enum FilterType { equals, greaterThan }

class WhereClause {
  const WhereClause._({
    required this.fieldName,
    required this.type,
    required this.value,
  });

  const factory WhereClause.equals({
    required String fieldName,
    required Object value,
  }) = _WhereClauseEqual;

  const factory WhereClause.greaterThan({
    required String fieldName,
    required Object value,
  }) = _WhereClauseGreaterThan;

  final String fieldName;
  final FilterType type;
  final Object value;
}

class _WhereClauseEqual extends WhereClause {
  const _WhereClauseEqual({
    required String fieldName,
    required Object value,
  }) : super._(
          fieldName: fieldName,
          value: value,
          type: FilterType.equals,
        );
}

class _WhereClauseGreaterThan extends WhereClause {
  const _WhereClauseGreaterThan({
    required String fieldName,
    required Object value,
  }) : super._(
          fieldName: fieldName,
          value: value,
          type: FilterType.greaterThan,
        );
}
