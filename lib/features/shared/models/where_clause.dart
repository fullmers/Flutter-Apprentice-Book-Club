enum FilterType { equals }

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
