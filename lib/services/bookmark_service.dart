import '../models/opportunity_model.dart';

class BookmarkService {
  static final List<Opportunity> _bookmarkedItems = [];

  static List<Opportunity> get bookmarks => List.unmodifiable(_bookmarkedItems);

  static void addBookmark(Opportunity opportunity) {
    if (!_bookmarkedItems.contains(opportunity)) {
      _bookmarkedItems.add(opportunity);
    }
  }

  static void removeBookmark(Opportunity opportunity) {
    _bookmarkedItems.remove(opportunity);
  }

  static bool isBookmarked(Opportunity opportunity) {
    return _bookmarkedItems.contains(opportunity);
  }
}
