use crate::ast::{FieldId, TopId};
use std::collections::BTreeMap;

#[derive(Default)]
pub(super) struct Relations {
    /// This contains only the relation fields actually present in the schema
    /// source text.
    pub(super) relation_fields: BTreeMap<(TopId, FieldId), RelationField>,
}

pub(crate) struct RelationField {
    pub(super) referenced_model: TopId,
}