abstract class PageConverter<PageEntity, Page> {
  Page createDto(PageEntity entity);
  PageEntity createEntity(Page dto);
}