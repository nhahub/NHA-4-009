import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/chat_room_model.dart';

class ChatService {
  final SupabaseCRUDService _supabaseCRUDService;

  ChatService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<List<Map<String, dynamic>>> getMessages({required String roomId}) {
    return _supabaseCRUDService.getData(
      table: kMessagesTable,
      filters: {'room_id': roomId},
      orderBy: 'created_at',
    );
  }

  Future<void> sendMessage({required Map<String, dynamic> data}) {
    return _supabaseCRUDService.addData(table: kMessagesTable, data: data);
  }

  Stream<List<Map<String, dynamic>>> listenToMessages(String roomId) {
    return _supabaseCRUDService.listenToTable(
      table: kMessagesTable,
      primaryKey: ['id'],
      filters: {'room_id': roomId},
      orderBy: 'created_at',
    );
  }

  Future<String> getOrCreateRoom({
    required String userId,
    required String therapistId,
  }) async {
    // Check if room exists
    final rooms = await _supabaseCRUDService.getData(
      table: kChatRoomsTable,
      filters: {'user_id': userId, 'therapist_id': therapistId},
    );

    if (rooms.isNotEmpty) {
      final room = ChatRoomModel.fromJson(rooms.first);
      return room.id;
    }

    // Create new room
    final roomId = await _supabaseCRUDService.addDataAndReturnField(
      field: 'id',
      table: kChatRoomsTable,
      data: {'user_id': userId, 'therapist_id': therapistId},
    );

    return roomId;
  }
}
