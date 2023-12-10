abstract interface class Converter<Entity, Dto> {
  Dto createDto(Entity entity);
  Entity createEntity(Dto dto);
}